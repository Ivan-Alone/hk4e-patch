use std::{ffi::CString, env};

use super::{MhyContext, MhyModule, ModuleType};
use crate::marshal;
use anyhow::Result;
use ilhook::x64::Registers;

const UNITY_WEB_REQUEST_SET_URL: usize = 0xD9442D0;

pub struct Http;

impl MhyModule for MhyContext<Http> {
    unsafe fn init(&mut self) -> Result<()> {
        self.interceptor.attach(
            self.assembly_base + UNITY_WEB_REQUEST_SET_URL,
            on_uwr_set_url,
        )
    }

    unsafe fn de_init(&mut self) -> Result<()> {
        Ok(())
    }

    fn get_module_type(&self) -> super::ModuleType {
        ModuleType::Http
    }
}

static mut SERVER_URL_BASE: String = String::new();

unsafe fn update_server_url() {
    if SERVER_URL_BASE == "" {
        SERVER_URL_BASE = String::from("http://127.0.0.1:21000");

        let mut flag_srv_next = false;

        for arg in env::args() {
            if flag_srv_next {
                SERVER_URL_BASE = String::from(arg);

                break;
            } else if arg.to_lowercase() == "--server" {
                flag_srv_next = true;
            }
        }
        
        if !flag_srv_next {
            println!("The argument that overrides the game server was not found! The default local address will be used.");
        }
        
        println!("Current game server: {SERVER_URL_BASE}");
    }
}

unsafe extern "win64" fn on_uwr_set_url(reg: *mut Registers, _: usize) {
    let str_length = *((*reg).rdx.wrapping_add(16) as *const u32);
    let str_ptr = (*reg).rdx.wrapping_add(20) as *const u8;

    let slice = std::slice::from_raw_parts(str_ptr, (str_length * 2) as usize);
    let url = String::from_utf16le(slice).unwrap();

    update_server_url();

    let mut new_url = SERVER_URL_BASE.clone();
    url.split('/').skip(3).for_each(|s| {
        new_url.push_str("/");
        new_url.push_str(s);
    });

    println!("Redirect: {url} -> {new_url}");
    (*reg).rdx =
        marshal::ptr_to_string_ansi(CString::new(new_url.as_str()).unwrap().as_c_str()) as u64;
}
