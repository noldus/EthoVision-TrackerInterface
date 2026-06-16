//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusEvrPresenter
// File       :   TfNepInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-09-2014 Andrius Zukas             - Original version
//----------------------------------------------------------------------------
#ifndef TFNEPINTERFACE1_H
#define TFNEPINTERFACE1_H

#pragma once

//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {9807FC9C-807B-41E3-98A8-75176F95A063}
static const GUID CLSID_NoldusEVRPresenter =
{ 0x9807fc9c, 0x807b, 0x41e3, { 0x98, 0xa8, 0x75, 0x17, 0x6f, 0x95, 0xa0, 0x63} };

// {33AD9C4C-856D-4B8A-A53E-2F9D866CCED1}
DEFINE_GUID(IID_INoldusEvrPresenterCallback, 
	0x33ad9c4c, 0x856d, 0x4b8a, 0xa5, 0x3e, 0x2f, 0x9d, 0x86, 0x6c, 0xce, 0xd1);

// Custom Attributes

// MFSamplePresenter_SampleCounter
// Data type: UINT32
//
// Version number for the video samples. When the presenter increments the version
// number, all samples with the previous version number are stale and should be
// discarded.
static const GUID MFSamplePresenter_SampleCounter = 
{ 0xb0bb83cc, 0xf10f, 0x4e2e, { 0xaa, 0x2b, 0x29, 0xea, 0x5e, 0x92, 0xef, 0x85 } };


// MFSamplePresenter_SampleSwapChain
// Data type: IUNKNOWN
// 
// Pointer to a Direct3D swap chain.
static const GUID MFSamplePresenter_SampleSwapChain = 
{ 0xad885bd1, 0x7def, 0x414a, { 0xb5, 0xb0, 0xd3, 0xd2, 0x63, 0xd6, 0xe9, 0x6d } };


// MFSamplePresenter_SampleTime
// Data type: UINT64
//
// Sample time of the currently displayed frame.
// {3B349EF5-A2EA-4AAB-B224-A5BC566F1D2B}
static const GUID MFSamplePresenter_SampleTime =
{ 0x3b349ef5, 0xa2ea, 0x4aab,{ 0xb2, 0x24, 0xa5, 0xbc, 0x56, 0x6f, 0x1d, 0x2b } };


//----------------------------------------------------------------------------
// struct TfNepVideoCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used for callbacks from evr presenter.
//----------------------------------------------------------------------------
struct TfNepVideoCallbackBase
{
	virtual HRESULT PresentSurfaceCallback(IDirect3DSurface9* pSurface) = 0;
};

MIDL_INTERFACE("33AD9C4C-856D-4B8A-A53E-2F9D866CCED1")
INoldusEvrPresenterCallback : public IUnknown
{
public:
	virtual HRESULT STDMETHODCALLTYPE RegisterCallback	(TfNepVideoCallbackBase* pCallback) = 0;
	virtual HRESULT STDMETHODCALLTYPE SetBufferCount	(int bufferCount) = 0;
};

#endif //TFNEPINTERFACE1_H
