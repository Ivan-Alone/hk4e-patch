ifdef RAX
	.code
		extern ORIGINAL_FUNCTIONS:QWORD
		GetFileVersionInfoA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[0 * 8]
		GetFileVersionInfoA endp
		GetFileVersionInfoByHandle proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[1 * 8]
		GetFileVersionInfoByHandle endp
		GetFileVersionInfoExA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[2 * 8]
		GetFileVersionInfoExA endp
		GetFileVersionInfoExW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[3 * 8]
		GetFileVersionInfoExW endp
		GetFileVersionInfoSizeA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[4 * 8]
		GetFileVersionInfoSizeA endp
		GetFileVersionInfoSizeExA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[5 * 8]
		GetFileVersionInfoSizeExA endp
		GetFileVersionInfoSizeExW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[6 * 8]
		GetFileVersionInfoSizeExW endp
		GetFileVersionInfoSizeW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[7 * 8]
		GetFileVersionInfoSizeW endp
		GetFileVersionInfoW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[8 * 8]
		GetFileVersionInfoW endp
		VerFindFileA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[9 * 8]
		VerFindFileA endp
		VerFindFileW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[10 * 8]
		VerFindFileW endp
		VerInstallFileA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[11 * 8]
		VerInstallFileA endp
		VerInstallFileW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[12 * 8]
		VerInstallFileW endp
		VerLanguageNameA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[13 * 8]
		VerLanguageNameA endp
		VerLanguageNameW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[14 * 8]
		VerLanguageNameW endp
		VerQueryValueA proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[15 * 8]
		VerQueryValueA endp
		VerQueryValueW proc
			jmp QWORD ptr ORIGINAL_FUNCTIONS[16 * 8]
		VerQueryValueW endp
else
	.model flat, C
	.stack 4096
	.code
		extern ORIGINAL_FUNCTIONS:DWORD
		GetFileVersionInfoA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[0 * 4]
		GetFileVersionInfoA endp
		GetFileVersionInfoByHandle proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[1 * 4]
		GetFileVersionInfoByHandle endp
		GetFileVersionInfoExA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[2 * 4]
		GetFileVersionInfoExA endp
		GetFileVersionInfoExW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[3 * 4]
		GetFileVersionInfoExW endp
		GetFileVersionInfoSizeA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[4 * 4]
		GetFileVersionInfoSizeA endp
		GetFileVersionInfoSizeExA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[5 * 4]
		GetFileVersionInfoSizeExA endp
		GetFileVersionInfoSizeExW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[6 * 4]
		GetFileVersionInfoSizeExW endp
		GetFileVersionInfoSizeW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[7 * 4]
		GetFileVersionInfoSizeW endp
		GetFileVersionInfoW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[8 * 4]
		GetFileVersionInfoW endp
		VerFindFileA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[9 * 4]
		VerFindFileA endp
		VerFindFileW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[10 * 4]
		VerFindFileW endp
		VerInstallFileA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[11 * 4]
		VerInstallFileA endp
		VerInstallFileW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[12 * 4]
		VerInstallFileW endp
		VerLanguageNameA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[13 * 4]
		VerLanguageNameA endp
		VerLanguageNameW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[14 * 4]
		VerLanguageNameW endp
		VerQueryValueA proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[15 * 4]
		VerQueryValueA endp
		VerQueryValueW proc
			jmp DWORD ptr ORIGINAL_FUNCTIONS[16 * 4]
		VerQueryValueW endp
endif
end
