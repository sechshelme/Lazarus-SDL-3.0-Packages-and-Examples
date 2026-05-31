unit SDL3_net;

interface

uses
  SDL3;

const
  {$IFDEF Linux}
  libSDL3_net = 'libSDL3_net.so';
  {$ENDIF}

  {$IFDEF Windows}
  libSDL3_net = 'SDL3_net.dll';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_net = 'libSDL3_net.dylib';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SDL_NET_MAJOR_VERSION = 3;
  SDL_NET_MINOR_VERSION = 2;
  SDL_NET_MICRO_VERSION = 0;

function NET_Version: longint; cdecl; external libSDL3_net;

type
  PNET_Status = ^TNET_Status;
  TNET_Status = longint;

const
  NET_FAILURE = -(1);
  NET_WAITING = 0;
  NET_SUCCESS = 1;

function NET_Init: Tbool; cdecl; external libSDL3_net;
procedure NET_Quit; cdecl; external libSDL3_net;

type
  PNET_Address = type Pointer;
  PPNET_Address = ^PNET_Address;

function NET_ResolveHostname(host: pchar): PNET_Address; cdecl; external libSDL3_net;
function NET_WaitUntilResolved(address: PNET_Address; timeout: TSint32): TNET_Status; cdecl; external libSDL3_net;
function NET_GetAddressStatus(address: PNET_Address): TNET_Status; cdecl; external libSDL3_net;
function NET_GetAddressString(address: PNET_Address): pchar; cdecl; external libSDL3_net;
function NET_GetAddressBytes(address: PNET_Address; num_bytes: Plongint): pointer; cdecl; external libSDL3_net;
function NET_RefAddress(address: PNET_Address): PNET_Address; cdecl; external libSDL3_net;
procedure NET_UnrefAddress(address: PNET_Address); cdecl; external libSDL3_net;
procedure NET_SimulateAddressResolutionLoss(percent_loss: longint); cdecl; external libSDL3_net;
function NET_CompareAddresses(a: PNET_Address; b: PNET_Address): longint; cdecl; external libSDL3_net;
function NET_GetLocalAddresses(num_addresses: Plongint): PPNET_Address; cdecl; external libSDL3_net;
procedure NET_FreeLocalAddresses(addresses: PPNET_Address); cdecl; external libSDL3_net;

type
  PNET_StreamSocket = Pointer;
  PPNET_StreamSocket = ^PNET_StreamSocket;

function NET_CreateClient(address: PNET_Address; port: TUint16; props: TSDL_PropertiesID): PNET_StreamSocket; cdecl; external libSDL3_net;
function NET_WaitUntilConnected(sock: PNET_StreamSocket; timeout: TSint32): TNET_Status; cdecl; external libSDL3_net;

type
  PNET_Server = type Pointer;

function NET_CreateServer(addr: PNET_Address; port: TUint16; props: TSDL_PropertiesID): PNET_Server; cdecl; external libSDL3_net;

const
  NET_PROP_SERVER_REUSEADDR_BOOLEAN = 'NET.server.reuseaddr';

function NET_AcceptClient(server: PNET_Server; client_stream: PPNET_StreamSocket): Tbool; cdecl; external libSDL3_net;
procedure NET_DestroyServer(server: PNET_Server); cdecl; external libSDL3_net;
function NET_GetStreamSocketAddress(sock: PNET_StreamSocket): PNET_Address; cdecl; external libSDL3_net;
function NET_GetConnectionStatus(sock: PNET_StreamSocket): TNET_Status; cdecl; external libSDL3_net;
function NET_WriteToStreamSocket(sock: PNET_StreamSocket; buf: pointer; buflen: longint): Tbool; cdecl; external libSDL3_net;
function NET_GetStreamSocketPendingWrites(sock: PNET_StreamSocket): longint; cdecl; external libSDL3_net;
function NET_WaitUntilStreamSocketDrained(sock: PNET_StreamSocket; timeout: TSint32): longint; cdecl; external libSDL3_net;
function NET_ReadFromStreamSocket(sock: PNET_StreamSocket; buf: pointer; buflen: longint): longint; cdecl; external libSDL3_net;
procedure NET_SimulateStreamPacketLoss(sock: PNET_StreamSocket; percent_loss: longint); cdecl; external libSDL3_net;
procedure NET_DestroyStreamSocket(sock: PNET_StreamSocket); cdecl; external libSDL3_net;

type
  PNET_DatagramSocket = type Pointer;

  TNET_Datagram = record
    addr: PNET_Address;
    port: TUint16;
    buf: PUint8;
    buflen: longint;
  end;
  PNET_Datagram = ^TNET_Datagram;
  PPNET_Datagram = ^PNET_Datagram;

function NET_CreateDatagramSocket(addr: PNET_Address; port: TUint16; props: TSDL_PropertiesID): PNET_DatagramSocket; cdecl; external libSDL3_net;

const
  NET_PROP_DATAGRAM_SOCKET_REUSEADDR_BOOLEAN = 'NET.datagram_socket.reuseaddr';
  NET_PROP_DATAGRAM_SOCKET_ALLOW_BROADCAST_BOOLEAN = 'NET.datagram_socket.allow_broadcast';

function NET_SendDatagram(sock: PNET_DatagramSocket; address: PNET_Address; port: TUint16; buf: pointer; buflen: longint): Tbool; cdecl; external libSDL3_net;
function NET_ReceiveDatagram(sock: PNET_DatagramSocket; dgram: PPNET_Datagram): Tbool; cdecl; external libSDL3_net;
procedure NET_DestroyDatagram(dgram: PNET_Datagram); cdecl; external libSDL3_net;
procedure NET_SimulateDatagramPacketLoss(sock: PNET_DatagramSocket; percent_loss: longint); cdecl; external libSDL3_net;
procedure NET_DestroyDatagramSocket(sock: PNET_DatagramSocket); cdecl; external libSDL3_net;
function NET_WaitUntilInputAvailable(vsockets: Ppointer; numsockets: longint; timeout: TSint32): longint; cdecl; external libSDL3_net;

function SDL_NET_VERSION: longint;
function SDL_NET_VERSION_ATLEAST(X, Y, Z: longint): boolean;

implementation

function SDL_NET_VERSION: longint;
begin
  SDL_NET_VERSION := SDL_VERSIONNUM(SDL_NET_MAJOR_VERSION, SDL_NET_MINOR_VERSION, SDL_NET_MICRO_VERSION);
end;

function SDL_NET_VERSION_ATLEAST(X, Y, Z: longint): boolean;
begin
  SDL_NET_VERSION_ATLEAST :=
    (SDL_NET_MAJOR_VERSION >= X) and
    ((SDL_NET_MAJOR_VERSION > X) or (SDL_NET_MINOR_VERSION >= Y)) and
    ((SDL_NET_MAJOR_VERSION > X) or (SDL_NET_MINOR_VERSION > Y) or (SDL_NET_MICRO_VERSION >= Z));
end;

end.
