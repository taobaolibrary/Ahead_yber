        ��  ��                  �      �� ��     0        (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ��  ���� ��������������������� ������� �� ������� ����� �����������������              ���������������� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� �� ��� ��� ������������������                                                                                                                                              (      �� ��     0        (                �                         �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���    �     � � ���������      �������� ��� � ��� � ��� � ��� � ��� � ��� � ��� � ��� ��������                                                                        "       �� ���    0                 �      (     (      �� ��     0        (                �                         �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���   ��� � �� � ��������      �������� � � � � � � � � � � � � � � � ��������                                                                           0   �� I D I _ S M A L L       0               (   J       �� ���    0             & F i l e   � �E & x i t   � & H e l p   � �& A b o u t   . . .            ��	 ���    0          ? �  � / �  �   8   �� I D D _ A B O U T B O X         0        � �        � K     A b o u t    S y s t e m       P     	   ���� ���  � P    1 
 w  ����� A h e a d L i b   V e r s i o n   1 . 0         P    1  w  ����� C o p y r i g h t   ( C )   2 0 1 6        P    �     ��� O K       �      �� ��d     0         ��       �	ˀ     �3    A h e a d L i b   	    �[SO            P  � 4 ������� �e�N              P  0  ������� ��eQ  D L L ( & D ) :               � �P?  ~  �  ���              �P�    �  ��� . . .                 P ' 0  ������� ���Q  C P P ( & C ) :               � �P? % ~  �  ���              �P� %   �  ��� . . .                X D /     ��� ub( & G )               P: D /  �  ��� 	�y�( & O ) > >               Po D /  �  ��� D S W   ub              P� D /     ���  ��Q( & X )               P \ � * ������� l��S            	 P i l  �  ��� �v�cl��S�Qpe( & R )             	  P v l  �  ��� sS�e�(u�Qpe( & I )               P � � * ������� }�eQ            	 P � l  �  ��� (WeQ�S-N}�eQ�S�Y  D L L ( & E )             	  P � l  �  ��� (W ����e}�eQ�S�Y  D L L ( & N )               P � � * ������� �(u            	 P � l  �  ��� �v�c�eQ�S�Y�Qpe( & J )             	  P � l  �  ��� �(u�S�Y�QpeTԏ�V( & T )                P� � D 
 �  ��� /ecY�~z( & M )                 P � � ! ������� �S�Y              P � 0  ������� �S�Y  D L L ( & L ) :               � �P? � F  �  ���              P� � D 
 �  ��� �|�~_( & S )               P � ! ������� vQ�[             P l 
 �  ��� ub  H O O K   �NxC   S t d ( & H )               ��P� 
 � "�  ���               Pu %  �  ��� A p i D b g               P� .  �  ��� A p i D b g   D S W     (  ,   A P I D B G   ���(      0        /////////////////////////////////////////////////////////////////////
// Author : CodeLive
// WeiBo  : http://weibo.com/1655194010
// Email  : dongfa@yeah.net
// QQ     : 5584173
// Date   : 2014.04.24
/////////////////////////////////////////////////////////////////////

#pragma once

#include <string>
using namespace std;
#define BUFFER_SIZE  1024
//�Ƿ�ʹ��ȫ�� �ļ�  
#define ISUSEFILE   0
extern bool gEnableLogOutput;
string  formatString(const char *format, ...);
string  toHexString( char *data, int size);
int     logOutput(const char *text);
int     logOutput(const string &text);


#if ISUSEFILE
int     appendDataToFile(const char *fileName, void *buffer, int size);
int     writeDataToFile(const char *fileName, void *buffer, int size);
int     readDataFromFile(const char *fileName, void *buffer, int size);
string  getLogString();
string  getFileName(const string &filePath);
wstring getAppNameW();
wstring getAppPath();
string  getModuleNameA(HMODULE hModule);
string  getAppNameA();
string  getAppPathA();
#endif   ,   A P I D B G   ���(      0        /////////////////////////////////////////////////////////////////////
// Author : CodeLive
// WeiBo  : http://weibo.com/1655194010
// Email  : dongfa@yeah.net
// QQ     : 5584173
// Date   : 2014.04.24
/////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Common.h"

static const char * gLogFile = "ApiDebugger.log";


#if 0
//old code 
string formatString(const char *format, ...)
{
	const int BUFFER_SIZE = 4097;
	char strbuf[BUFFER_SIZE];
    memset(strbuf, 0, sizeof(strbuf));

	va_list ap;
	va_start (ap, format);
	int result = ::vsnprintf(strbuf, BUFFER_SIZE-1, format, ap);
	va_end (ap);

	return string(strbuf, result);
}
#endif

//����Ҫ�õ�unicode to ascii
string formatString(const char *format, ...)
{
//	const int BUFFER_SIZE = 1024;
	char strbuf[BUFFER_SIZE]={0};
   // memset(strbuf, 0, sizeof(strbuf));
	va_list ap;
	va_start (ap, format);
	int len = vsprintf(strbuf, format, ap);
	strbuf[len]=0;
	va_end (ap);
	return string(strbuf, len);
}


string toHexString(char *data, int size)
{
	string result(size*2, 0);
	static char *chars = "0123456789ABCDEF";
	for(int i = 0; i < size; i ++)
	{
		char ch = data[i];
		result[i*2+0] = chars[(ch & 0xF0) >> 4];
		result[i*2+1] = chars[(ch & 0x0F)];
	}
	return result;
}
#if ISUSEFILE

wstring getAppNameW()
{
	wstring appName;
	wchar_t szPathName[_MAX_PATH];
	memset(szPathName, 0, sizeof(szPathName));
	GetModuleFileNameW(NULL, szPathName, _MAX_PATH);
	appName = szPathName;
	return appName;
}

wstring getAppPath()
{
	wstring appName = getAppNameW();
	int pos = (int)appName.find_last_of(L"\\/");
	return appName.substr(0, pos+1);
}

string getModuleNameA(HMODULE hModule)
{
	string appName;
	char szPathName[_MAX_PATH];
	memset(szPathName, 0, sizeof(szPathName));
	GetModuleFileNameA(hModule, szPathName, _MAX_PATH);
	appName = szPathName;
	return appName;
}

string getAppNameA()
{
    return getModuleNameA(NULL);
}

string getAppPathA()
{
	string appName = getAppNameA();
	int pos = (int)appName.find_last_of("\\/");
	return appName.substr(0, pos+1);
}

string getFileName(const string &filePath)
{
    int pos = (int)filePath.find_last_of("\\/");
    if(pos > 0)
    {
        return filePath.substr(pos+1);
    }
    return filePath;
}
string getLogString()
{
    SYSTEMTIME sysTime = { 0 };
    GetLocalTime(&sysTime);
    return formatString("[% 6d]%02d:%02d:%02d.%03d", (int)GetCurrentThreadId(),
        (int)sysTime.wHour, (int)sysTime.wMinute, (int)sysTime.wSecond, (int)sysTime.wMilliseconds);
}

int writeDataToFile(const char *fileName, void *buffer, int size)
{
    string filePath = getAppPathA() + fileName;
    FILE *pFile = fopen(filePath.c_str(), "wb");
    if(pFile != NULL)
    {
        int ret = fwrite(buffer, 1, size, pFile);
        fclose(pFile);
        pFile = NULL;
        return ret;
    }
    return -1;
}

int readDataFromFile(const char *fileName, void *buffer, int size)
{
    string filePath = getAppPathA() + fileName;
    FILE *pFile = fopen(filePath.c_str(), "rb");
    if(pFile != NULL)
    {
        int ret = fread(buffer, 1, size, pFile);
        fclose(pFile);
        pFile = NULL;
        return ret;
    }
    return -1;
}

int appendDataToFile(const char *fileName, void *buffer, int size)
{
    string filePath = getAppPathA() + fileName;
    FILE *pFile = fopen(filePath.c_str(), "ab");
    if(pFile != NULL)
    {
        fseek(pFile, 0, SEEK_END);
        int ret = fwrite(buffer, 1, size, pFile);
        fclose(pFile);
        pFile = NULL;
        return ret;
    }
    return -1;
}

#endif

int logOutput(const char *text)
{

#if ISUSEFILE
    if(!gEnableLogOutput)
    {
        return false;
    }
    string filePath = getAppPathA() + gLogFile;
    FILE *pFile = fopen(filePath.c_str(), "ab");
    if(pFile != NULL)
    {
        fseek(pFile, 0, SEEK_END);
        string tstr = getLogString() + " - ";
        int ret = fwrite(tstr.c_str(), 1, tstr.length(), pFile);
        ret = fwrite(text, 1, strlen(text), pFile);
        fclose(pFile);
        pFile = NULL;
        return ret;
    }
#else
	OutputDebugString(text);
#endif
    return -1;
}

int logOutput(const string &text)
{
    return logOutput(text.c_str());
}
�  ,   A P I D B G   ���(      0        /////////////////////////////////////////////////////////////////////
// Author : CodeLive
// WeiBo  : http://weibo.com/1655194010
// Email  : dongfa@yeah.net
// QQ     : 5584173
// Date   : 2004.04.21
/////////////////////////////////////////////////////////////////////

#ifndef __ADHOOKAPI_H__
#define __ADHOOKAPI_H__
#include <windows.h>
#include <tchar.h>
#include <vector>
using namespace std;

// class CAdAutoHookApi
class CAdHookApi;
class CAdAutoHookApi
{
public:
	CAdAutoHookApi(CAdHookApi *pHookApi, void *pAddr);
	virtual ~CAdAutoHookApi();

	private:
	CAdHookApi *m_pHookApi;
	void       *m_pAddr;


};

// class CAdAutoHook
class CAdHookApi  
{
public:
	CAdHookApi();
	virtual ~CAdHookApi();
	
protected:
	struct HookMap
	{
		HANDLE hProcess;   //��ǰ�߳�
		void  *pOldAddr;   //patch �ĺ�����ַ
		void  *pNewAddr;   //�Զ���ĺ�����ַ
		BYTE   chOldCode[8];  //��oldAddr����������ASM
		BYTE   chNewCode[8];  //��������� ��תASM
		BOOL   bHooked;      //�Ƿ��Ѿ����ASM��־
		DWORD  dwData;      //���Ӳ���
	};
public:
	HANDLE Add(LPCTSTR lpszModule, LPCSTR lpcFuncName, void *pNewAddr, DWORD dwData = 0);
	HANDLE Add(void *pOldAddr, void *pNewAddr, const BYTE *verifyData = NULL, DWORD verifySize = 0, DWORD dwData = 0);
	BOOL   Remove(HANDLE hHook);
	BOOL   Begin(HANDLE hHook);
	BOOL   End(HANDLE hHook);
	BOOL   Begin2(void *pNewAddr);
	BOOL   End2(void *pNewAddr);
	int    BeginAll();
	int    EndAll();
	int    GetCount();
	void  *OldAddr2NewAddr(void *pOldAddr);
	void  *NewAddr2OldAddr(void *pNewAddr);

public:
    static BOOL VerifyAddress(void *pAddr, const BYTE *verifyData, DWORD verifySize);

    static BOOL PatchCode(void *pAddr,  BYTE *pCode, DWORD dwCode, 
         BYTE *verifyData = NULL, DWORD verifySize = 0);
	
protected:
	CAdHookApi::HookMap *FromNewAddr(void *pNewAddr);
	CAdHookApi::HookMap *FromOldAddr(void *pOldAddr);
	BOOL HasHook(HANDLE hHook);

protected:
	vector<HookMap *> m_obHooks;
};

#endif // __ADHOOKAPI_H__
   Q"  ,   A P I D B G   ���(      0        /////////////////////////////////////////////////////////////////////
// Author : CodeLive
// WeiBo  : http://weibo.com/1655194010
// Email  : dongfa@yeah.net
// QQ     : 5584173
// Date   : 2014.04.21
/////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "AdHookApi.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <Windows.h>
#include "Common.h"

static BOOL gUseAPI = TRUE;

static BOOL WINAPI myReadMemory(HANDLE hProcess, LPVOID lpAddress, LPVOID lpBuffer, SIZE_T nSize)
{
    BOOL bRet = FALSE;
    DWORD dwOldProtect = 0;
    bRet = VirtualProtect(lpAddress, nSize, PAGE_READONLY, &dwOldProtect);
    if(gUseAPI)
    {
        DWORD dwRead = 0;
        bRet = ReadProcessMemory(hProcess, lpAddress, lpBuffer, nSize, &dwRead);
    }
    else
    {
        memcpy(lpBuffer, lpAddress, nSize);
    }
    VirtualProtect(lpAddress, nSize, dwOldProtect, &dwOldProtect);
    assert(bRet);
    return bRet;
}

static BOOL WINAPI myWriteMemory(HANDLE hProcess, LPVOID lpAddress, LPVOID lpBuffer, SIZE_T nSize)
{
    BOOL bRet = FALSE;
    DWORD dwOldProtect = 0;
    bRet = VirtualProtect(lpAddress, nSize, PAGE_READWRITE, &dwOldProtect);
    if(gUseAPI)
    {
        DWORD dwWrite = 0;
        bRet = WriteProcessMemory(hProcess, lpAddress, lpBuffer, nSize, &dwWrite);
    }
    else
    {
        memcpy(lpAddress, lpBuffer, nSize);
    }
    VirtualProtect(lpAddress, nSize, dwOldProtect, &dwOldProtect);
    assert(bRet);
    return bRet;
}

// class CAdAutoHookApi
CAdAutoHookApi::CAdAutoHookApi(CAdHookApi *pHookApi, void *pAddr)
{
	m_pHookApi = pHookApi;
	m_pAddr    = pAddr;   //�Զ��庯����ַ

	assert(m_pHookApi != NULL);

	if(m_pHookApi != NULL)
    {
		m_pHookApi->End2(m_pAddr);//ԭ�����뻹ԭ
    }
}

CAdAutoHookApi::~CAdAutoHookApi()
{
	if(m_pHookApi != NULL)
    {
		m_pHookApi->Begin2(m_pAddr);//����Ϊ���д���
    }
}

// class CAdHookApi
CAdHookApi::CAdHookApi()
{
}

CAdHookApi::~CAdHookApi()
{
	EndAll();
}

BOOL CAdHookApi::VerifyAddress(void *pAddr, const BYTE *verifyData, DWORD verifySize)
{
    BOOL isPassed = FALSE;
    if((verifyData != NULL) && (verifySize > 0))
    {
        BYTE *addrData = new BYTE[verifySize];
        if(myReadMemory(GetCurrentProcess(), pAddr, addrData, verifySize))
        {
            if(memcmp(addrData, verifyData, verifySize) == 0)
            {
                isPassed = TRUE;
            }
        }
        delete []addrData;
    }
    else
    {
        isPassed = TRUE;
    }
    return isPassed;
}
//���ʹ��PatchCode������
BOOL CAdHookApi::PatchCode(void *pAddr,  BYTE *pCode, DWORD dwCode, 
                            BYTE *verifyData, DWORD verifySize)
{
    if(!VerifyAddress(pAddr, verifyData, verifySize))
    {
        return FALSE;
    }
	//dwCode ��size 
    BOOL bRet = myWriteMemory(GetCurrentProcess(), pAddr, pCode, dwCode);
    return bRet;
}
//	gHooks.Add(_T("User32.DLL"), "MessageBoxA", My_MessageBox);
HANDLE CAdHookApi::Add(LPCTSTR lpszModule, LPCSTR lpcFuncName, void *pNewAddr, DWORD dwData)
{
	//ֻload һ��dll��ԭ��
    HMODULE hModule = LoadLibrary(lpszModule);
    if(hModule == NULL)
    {
			OutputDebugString("apidebug lib=null");
        return NULL;
    }
     //�Ӷ�̬����ȡ���Ϻ����ĵ�ַ
    void *pOldAddr = (void *)GetProcAddress(hModule, lpcFuncName);
    if(pOldAddr == NULL)
    {
		OutputDebugString("apidebug pold=null");
        return NULL;
    }
	//�����ǵ������÷�
	//const BYTE verifyData[] = { 0x55, 0x8B, 0xEC, 0x81, 0xEC, 0x2C, 0x01, 0x00, 0x00 };
    //void *addr = (void *)0x004026B0;
    // if(gHooks.Add(addr, my_sub_4026B0, verifyData, sizeof(verifyData), 0) != NULL)
    return Add(pOldAddr, pNewAddr, NULL, 0, dwData);
}

HANDLE CAdHookApi::Add(void *pOldAddr, void *pNewAddr, const BYTE *verifyData, DWORD verifySize, DWORD dwData)
{
	BOOL bRet = FALSE;
	HookMap *pHook = new HookMap;
	do
	{
		ZeroMemory(pHook, sizeof(HookMap));
		
		pHook->hProcess = GetCurrentProcess();//��ǰ���̵�Handle

		pHook->pOldAddr = pOldAddr;//ԭ��������ַ  ��һ��memory�ռ���
		if(pHook->pOldAddr == NULL)
        {
			break ;
        }

		DWORD dwRead = 8;
        if((verifyData != NULL) && (verifySize > 0) && (verifySize > dwRead))
        {
            dwRead = verifySize;//��Ӧ��С
        }
        BYTE *addrData = new BYTE[dwRead];//�����̱����غ��.text�����  ��dll�Ǹ����ڽ��̿ռ����
		if(!myReadMemory(pHook->hProcess, pHook->pOldAddr, addrData, dwRead))//��8��Bytes
        {
            delete []addrData;
			break ;
        }
		//���У������ �ǲ�����Ҫ����
        if((verifyData != NULL) && (verifySize > 0) && (memcmp(addrData, verifyData, verifySize) != 0))
        {
            delete []addrData;
            break ;
        }


        memcpy(pHook->chOldCode, addrData, 8);
        delete []addrData;

		DWORD dwTemp = (DWORD)pNewAddr;
		pHook->pNewAddr = pNewAddr;

		//��תָ������ ASM CODE
		// mov eax, pNewAddr
		// jmp eax
		pHook->chNewCode[0] = 0xB8;
		memcpy(pHook->chNewCode + 1, &dwTemp, sizeof(DWORD));
		pHook->chNewCode[5] = 0xFF;
		pHook->chNewCode[6] = 0xE0;			

		pHook->bHooked = FALSE;

		pHook->dwData = dwData;

		m_obHooks.push_back(pHook);

		bRet = TRUE;
	}while(0);//���д��������

	if(!bRet)
	{
		delete pHook;
		pHook = NULL;
	}

	return (HANDLE)pHook;
}

BOOL CAdHookApi::Remove(HANDLE hHook)
{
	BOOL bRet = FALSE;
	HookMap *pHook = (HookMap *)hHook;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		if(pTemp == pHook)
		{
			End((HANDLE)pTemp);//�ָ�ԭ����  �� call�� jump
			delete pHook;
			m_obHooks.erase(m_obHooks.begin() + i);
			bRet = TRUE;
			break ;
		}
	}

	return bRet;
}

BOOL CAdHookApi::Begin(HANDLE hHook)
{
	if(!HasHook(hHook))
    {
		return FALSE;
    }
	HookMap *pHook = (HookMap *)hHook;
	if(pHook->bHooked)
    {
		return TRUE;
    }
	DWORD dwWrite = 8;    
    BOOL bRet = myWriteMemory(pHook->hProcess, pHook->pOldAddr, pHook->chNewCode, dwWrite);
	if(bRet)
    {
		pHook->bHooked = TRUE;
    }
	return bRet;
}

BOOL CAdHookApi::End(HANDLE hHook)
{
	if(!HasHook(hHook))
    {
		return FALSE;
    }
	HookMap *pHook = (HookMap *)hHook;
	if(!pHook->bHooked)
    {
		return FALSE;
    }
	DWORD dwWrite = 8;
	//���ｫԭ���Ĵ��뻹ԭ
    BOOL bRet = myWriteMemory(pHook->hProcess, pHook->pOldAddr, pHook->chOldCode, dwWrite);
	if(bRet)
    {
		pHook->bHooked = FALSE;
    }
	return bRet;
}

BOOL CAdHookApi::Begin2(void *pNewAddr)
{
	HookMap *pHook = FromNewAddr(pNewAddr);
	if(pHook == NULL)
    {
		return FALSE;
    }

	return Begin((HANDLE)pHook);
}

BOOL CAdHookApi::End2(void *pNewAddr)
{
	HookMap *pHook = FromNewAddr(pNewAddr);
	if(pHook == NULL)
    {
		return FALSE;
    }
	
	return End((HANDLE)pHook);
}

void *CAdHookApi::OldAddr2NewAddr(void *pOldAddr)
{
	HookMap *pHook = FromOldAddr(pOldAddr);
	if(pHook == NULL)
    {
		return NULL;
    }
	
	return pHook->pNewAddr;
}

void *CAdHookApi::NewAddr2OldAddr(void *pNewAddr)
{
	HookMap *pHook = FromNewAddr(pNewAddr);
	if(pHook == NULL)
    {
		return NULL;
    }
	
	return pHook->pOldAddr;
}

CAdHookApi::HookMap *CAdHookApi::FromNewAddr(void *pNewAddr)
{
	HookMap *pHook = NULL;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		if(pTemp->pNewAddr == pNewAddr)
		{
			pHook = pTemp;
			break ;
		}
	}
	
	return pHook;
}

CAdHookApi::HookMap *CAdHookApi::FromOldAddr(void *pOldAddr)
{
	HookMap *pHook = NULL;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		if(pTemp->pOldAddr == pOldAddr)
		{
			pHook = pTemp;
			break ;
		}
	}
	
	return pHook;
}

BOOL CAdHookApi::HasHook(HANDLE hHook)
{
	BOOL bRet = FALSE;
	HookMap *pHook = (HookMap *)hHook;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		if(pTemp == pHook)
		{
			bRet = TRUE;
			break ;
		}
	}
	
	return bRet;
}

int CAdHookApi::BeginAll()
{
	int nRet = 0;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		BOOL bRet = Begin((HANDLE)pTemp);
		if(bRet)
        {
			nRet ++;
        }
	}

	return nRet;
}

int CAdHookApi::EndAll()
{
	int nRet = 0;
	for(int i = 0; i < (int)m_obHooks.size(); i ++)
	{
		HookMap *pTemp = m_obHooks[i];
		BOOL bRet = End((HANDLE)pTemp);
		delete pTemp;
		if(bRet)
        {
			nRet ++;
        }
	}
	m_obHooks.clear();

	return nRet;
}

int CAdHookApi::GetCount()
{
	return (int)m_obHooks.size();
}
     ,   A P I D B G   ���(      0        

//#ifdef APIDEBUGGER_EXPORTS
//#define APIDEBUGGER __declspec(dllexport)
//#else
//#define APIDEBUGGER __declspec(dllimport)
//#endif

#define APIDEBUGGER __declspec(dllexport)
extern "C" APIDEBUGGER const char * ApiDebugger();
void ApiDebugferShutdown();   ,   A P I D B G   ���(      0        

//#ifdef APIDEBUGGER_EXPORTS
//#define APIDEBUGGER __declspec(dllexport)
//#else
//#define APIDEBUGGER __declspec(dllimport)
//#endif

#define APIDEBUGGER __declspec(dllexport)
extern "C" APIDEBUGGER const char * ApiDebugger();
void ApiDebugferShutdown();   ,   A P I D B G   ���(      0        Microsoft Developer Studio Workspace File, Format Version 6.00
# ����: ���ܱ༭��ɾ���ù������ļ���

###############################################################################

Project: "boAPIDebug"=".\boAPIDebug.dsp" - Package Owner=<4>

Package=<5>
{{{
}}}

Package=<4>
{{{
}}}

###############################################################################

Global:

Package=<5>
{{{
}}}

Package=<3>
{{{
}}}

###############################################################################

L  ,   A P I D B G   ���(      0        # Microsoft Developer Studio Project File - Name="boAPIDebug" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=boAPIDebug - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "boAPIDebug.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "boAPIDebug.mak" CFG="boAPIDebug - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "boAPIDebug - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "boAPIDebug - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "boAPIDebug - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "BOAPIDEBUG_EXPORTS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "BOAPIDEBUG_EXPORTS" /FR /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386

!ELSEIF  "$(CFG)" == "boAPIDebug - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "BOAPIDEBUG_EXPORTS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "BOAPIDEBUG_EXPORTS" /FR /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "boAPIDebug - Win32 Release"
# Name "boAPIDebug - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\AdHookApi.cpp
# End Source File
# Begin Source File

SOURCE=.\ApiDebugger.cpp
# End Source File
# Begin Source File

SOURCE=.\Common.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\AdHookApi.h
# End Source File
# Begin Source File

SOURCE=.\ApiDebugger.h
# End Source File
# Begin Source File

SOURCE=.\Common.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
0       �� ��@     0                                       A H E A D L I B H       �� ��A     0         A h e a d L i b  H e l l o   W o r l d !                             