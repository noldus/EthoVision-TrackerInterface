//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusEVRPresenterCallback
// Module     :   NoldusEvrPresenterCallback
// File       :   TfNepInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 17-05-2023 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNEPINTERFACE2_H
#define TFNEPINTERFACE2_H

#pragma once

#include <d3d9.h>


// The name of our presenter
#define STR_EVRPRESENTER  L"NoldusEVRPresenter2\0"

//------------------------------------------------------------------------------
// CLSID_NoldusEVRPresenter2 - {E94D76A2-C752-4E68-B783-4A059711B6FB}
//------------------------------------------------------------------------------
static const GUID CLSID_NoldusEVRPresenter2 = { 0xe94d76a2, 0xc752, 0x4e68, { 0xb7, 0x83, 0x4a, 0x5, 0x97, 0x11, 0xb6, 0xfb } };

//------------------------------------------------------------------------------
// IID_INoldusEvrPresenter2 - {E94D76A2-C752-4E68-B783-4A059711B6FC}
//------------------------------------------------------------------------------
DEFINE_GUID(IID_INoldusEvrPresenter2, 0xe94d76a2, 0xc752, 0x4e68, 0xb7, 0x83, 0x4a, 0x5, 0x97, 0x11, 0xb6, 0xfc);

//------------------------------------------------------------------------------
// MFSamplePresenter_SampleTime - {3B349EF5-A2EA-4AAB-B224-A5BC566F1D2B}
//------------------------------------------------------------------------------
static const GUID MFSamplePresenter_SampleTime = { 0x3b349ef5, 0xa2ea, 0x4aab,{ 0xb2, 0x24, 0xa5, 0xbc, 0x56, 0x6f, 0x1d, 0x2b } };


//----------------------------------------------------------------------------
// struct TfNepVideoCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used for callbacks from evr presenter.
//----------------------------------------------------------------------------
struct TfNepVideoCallbackBase
{
	virtual HRESULT PresentSurfaceCallback(IDirect3DSurface9* pSurface) = 0;
};


//----------------------------------------------------------------------------
// struct INoldusEvrPresenter2
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("E94D76A2-C752-4E68-B783-4A059711B6FC")
INoldusEvrPresenter2 : public IUnknown
{
public:
	virtual HRESULT	STDMETHODCALLTYPE	CreateRenderer(IUnknown** ppRenderer) = 0;
	virtual HRESULT STDMETHODCALLTYPE	RegisterCallback(TfNepVideoCallbackBase* pCallback) = 0;
	virtual int STDMETHODCALLTYPE		GetRotation() = 0;
	virtual void STDMETHODCALLTYPE		SetRotation(int nRotation) = 0;
	virtual bool STDMETHODCALLTYPE		GetFlip() = 0;
	virtual void STDMETHODCALLTYPE		SetFlip(bool bFlip) = 0;
};

#endif //TFNEPINTERFACE2_H
