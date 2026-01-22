unit SDL3_image;

interface

uses
  SDL3;

const
  {$IFDEF Linux}
  libSDL3_image = 'libSDL3_image.so';
  {$ENDIF}

  {$IFDEF Windows}
  libSDL3_image = 'SDL3_image.dll';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_image = 'libSDL3_image.dylib';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SDL_IMAGE_MAJOR_VERSION = 3;
  SDL_IMAGE_MINOR_VERSION = 4;
  SDL_IMAGE_MICRO_VERSION = 0;

function SDL_IMAGE_VERSION: longint;
function SDL_IMAGE_VERSION_ATLEAST(X, Y, Z: longint): boolean;

function IMG_Version: longint; cdecl; external libSDL3_image;
function IMG_Load(file_: pchar): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_Load_IO(src: PSDL_IOStream; closeio: Tbool): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadTyped_IO(src: PSDL_IOStream; closeio: Tbool; _type: pchar): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadTexture(renderer: PSDL_Renderer; file_: pchar): PSDL_Texture; cdecl; external libSDL3_image;
function IMG_LoadTexture_IO(renderer: PSDL_Renderer; src: PSDL_IOStream; closeio: Tbool): PSDL_Texture; cdecl; external libSDL3_image;
function IMG_LoadTextureTyped_IO(renderer: PSDL_Renderer; src: PSDL_IOStream; closeio: Tbool; _type: pchar): PSDL_Texture; cdecl; external libSDL3_image;
function IMG_LoadGPUTexture(device: PSDL_GPUDevice; copy_pass: PSDL_GPUCopyPass; file_: pchar; width: Plongint; height: Plongint): PSDL_GPUTexture; cdecl; external libSDL3_image;
function IMG_LoadGPUTexture_IO(device: PSDL_GPUDevice; copy_pass: PSDL_GPUCopyPass; src: PSDL_IOStream; closeio: Tbool; width: Plongint; height: Plongint): PSDL_GPUTexture; cdecl; external libSDL3_image;
function IMG_LoadGPUTextureTyped_IO(device: PSDL_GPUDevice; copy_pass: PSDL_GPUCopyPass; src: PSDL_IOStream; closeio: Tbool; _type: pchar; width: Plongint; height: Plongint): PSDL_GPUTexture; cdecl; external libSDL3_image;

function IMG_GetClipboardImage: PSDL_Surface; cdecl; external libSDL3_image;

function IMG_isANI(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isAVIF(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isCUR(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isBMP(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isGIF(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isICO(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isJPG(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isJXL(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isLBM(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isPCX(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isPNG(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isPNM(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isQOI(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isSVG(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isTIF(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isWEBP(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isXCF(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isXPM(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;
function IMG_isXV(src: PSDL_IOStream): Tbool; cdecl; external libSDL3_image;

function IMG_LoadAVIF_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadBMP_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadCUR_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadGIF_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadICO_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadJPG_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadJXL_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadLBM_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadPCX_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadPNG_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadPNM_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadSVG_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadSizedSVG_IO(src: PSDL_IOStream; width: longint; height: longint): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadQOI_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadTGA_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadTIF_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadWEBP_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadXCF_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadXPM_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_LoadXV_IO(src: PSDL_IOStream): PSDL_Surface; cdecl; external libSDL3_image;

function IMG_ReadXPMFromArray(xpm: PPchar): PSDL_Surface; cdecl; external libSDL3_image;
function IMG_ReadXPMFromArrayToRGB888(xpm: PPchar): PSDL_Surface; cdecl; external libSDL3_image;

function IMG_Save(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveTyped_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool; _type: pchar): Tbool; cdecl; external libSDL3_image;

function IMG_SaveAVIF(surface: PSDL_Surface; file_: pchar; quality: longint): Tbool; cdecl; external libSDL3_image;
function IMG_SaveAVIF_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool; quality: longint): Tbool; cdecl; external libSDL3_image;
function IMG_SaveBMP(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveBMP_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveCUR(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveCUR_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveGIF(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveGIF_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveICO(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveICO_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveJPG(surface: PSDL_Surface; file_: pchar; quality: longint): Tbool; cdecl; external libSDL3_image;
function IMG_SaveJPG_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool; quality: longint): Tbool; cdecl; external libSDL3_image;
function IMG_SavePNG(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SavePNG_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveTGA(surface: PSDL_Surface; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveTGA_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveWEBP(surface: PSDL_Surface; file_: pchar; quality: single): Tbool; cdecl; external libSDL3_image;
function IMG_SaveWEBP_IO(surface: PSDL_Surface; dst: PSDL_IOStream; closeio: Tbool; quality: single): Tbool; cdecl; external libSDL3_image;

type
  TIMG_Animation = record
    w: longint;
    h: longint;
    count: longint;
    frames: ^PSDL_Surface;
    delays: Plongint;
  end;
  PIMG_Animation = ^TIMG_Animation;

function IMG_LoadAnimation(file_: pchar): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadAnimation_IO(src: PSDL_IOStream; closeio: Tbool): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadAnimationTyped_IO(src: PSDL_IOStream; closeio: Tbool; _type: pchar): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadANIAnimation_IO(src: PSDL_IOStream): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadAPNGAnimation_IO(src: PSDL_IOStream): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadAVIFAnimation_IO(src: PSDL_IOStream): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadGIFAnimation_IO(src: PSDL_IOStream): PIMG_Animation; cdecl; external libSDL3_image;
function IMG_LoadWEBPAnimation_IO(src: PSDL_IOStream): PIMG_Animation; cdecl; external libSDL3_image;

function IMG_SaveAnimation(anim: PIMG_Animation; file_: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveAnimationTyped_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool; _type: pchar): Tbool; cdecl; external libSDL3_image;
function IMG_SaveANIAnimation_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveAPNGAnimation_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveAVIFAnimation_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool; quality: longint): Tbool; cdecl; external libSDL3_image;
function IMG_SaveGIFAnimation_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_image;
function IMG_SaveWEBPAnimation_IO(anim: PIMG_Animation; dst: PSDL_IOStream; closeio: Tbool; quality: longint): Tbool; cdecl; external libSDL3_image;

function IMG_CreateAnimatedCursor(anim: PIMG_Animation; hot_x: longint; hot_y: longint): PSDL_Cursor; cdecl; external libSDL3_image;
procedure IMG_FreeAnimation(anim: PIMG_Animation); cdecl; external libSDL3_image;

type
  PIMG_AnimationEncoder = type Pointer;

function IMG_CreateAnimationEncoder(file_: pchar): PIMG_AnimationEncoder; cdecl; external libSDL3_image;
function IMG_CreateAnimationEncoder_IO(dst: PSDL_IOStream; closeio: Tbool; _type: pchar): PIMG_AnimationEncoder; cdecl; external libSDL3_image;
function IMG_CreateAnimationEncoderWithProperties(props: TSDL_PropertiesID): PIMG_AnimationEncoder; cdecl; external libSDL3_image;

const
  IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING = 'SDL_image.animation_encoder.create.filename';
  IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER = 'SDL_image.animation_encoder.create.iostream';
  IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = 'SDL_image.animation_encoder.create.iostream.autoclose';
  IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING = 'SDL_image.animation_encoder.create.type';
  IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER = 'SDL_image.animation_encoder.create.quality';
  IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER = 'SDL_image.animation_encoder.create.timebase.numerator';
  IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER = 'SDL_image.animation_encoder.create.timebase.denominator';
  IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_MAX_THREADS_NUMBER = 'SDL_image.animation_encoder.create.avif.max_threads';
  IMG_PROP_ANIMATION_ENCODER_CREATE_AVIF_KEYFRAME_INTERVAL_NUMBER = 'SDL_image.animation_encoder.create.avif.keyframe_interval';
  IMG_PROP_ANIMATION_ENCODER_CREATE_GIF_USE_LUT_BOOLEAN = 'SDL_image.animation_encoder.create.gif.use_lut';

function IMG_AddAnimationEncoderFrame(encoder: PIMG_AnimationEncoder; surface: PSDL_Surface; duration: TUint64): Tbool; cdecl; external libSDL3_image;
function IMG_CloseAnimationEncoder(encoder: PIMG_AnimationEncoder): Tbool; cdecl; external libSDL3_image;

type
  PIMG_AnimationDecoderStatus = ^TIMG_AnimationDecoderStatus;
  TIMG_AnimationDecoderStatus = longint;

const
  IMG_DECODER_STATUS_INVALID = -(1);
  IMG_DECODER_STATUS_OK = (-(1)) + 1;
  IMG_DECODER_STATUS_FAILED = (-(1)) + 2;
  IMG_DECODER_STATUS_COMPLETE = (-(1)) + 3;

type
  PIMG_AnimationDecoder = type Pointer;

function IMG_CreateAnimationDecoder(file_: pchar): PIMG_AnimationDecoder; cdecl; external libSDL3_image;
function IMG_CreateAnimationDecoder_IO(src: PSDL_IOStream; closeio: Tbool; _type: pchar): PIMG_AnimationDecoder; cdecl; external libSDL3_image;
function IMG_CreateAnimationDecoderWithProperties(props: TSDL_PropertiesID): PIMG_AnimationDecoder; cdecl; external libSDL3_image;

const
  IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING = 'SDL_image.animation_decoder.create.filename';
  IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER = 'SDL_image.animation_decoder.create.iostream';
  IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN = 'SDL_image.animation_decoder.create.iostream.autoclose';
  IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING = 'SDL_image.animation_decoder.create.type';
  IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_NUMERATOR_NUMBER = 'SDL_image.animation_decoder.create.timebase.numerator';
  IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER = 'SDL_image.animation_decoder.create.timebase.denominator';
  IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_MAX_THREADS_NUMBER = 'SDL_image.animation_decoder.create.avif.max_threads';
  IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_INCREMENTAL_BOOLEAN = 'SDL_image.animation_decoder.create.avif.allow_incremental';
  IMG_PROP_ANIMATION_DECODER_CREATE_AVIF_ALLOW_PROGRESSIVE_BOOLEAN = 'SDL_image.animation_decoder.create.avif.allow_progressive';
  IMG_PROP_ANIMATION_DECODER_CREATE_GIF_TRANSPARENT_COLOR_INDEX_NUMBER = 'SDL_image.animation_encoder.create.gif.transparent_color_index';
  IMG_PROP_ANIMATION_DECODER_CREATE_GIF_NUM_COLORS_NUMBER = 'SDL_image.animation_encoder.create.gif.num_colors';

function IMG_GetAnimationDecoderProperties(decoder: PIMG_AnimationDecoder): TSDL_PropertiesID; cdecl; external libSDL3_image;

const
  IMG_PROP_METADATA_IGNORE_PROPS_BOOLEAN = 'SDL_image.metadata.ignore_props';
  IMG_PROP_METADATA_DESCRIPTION_STRING = 'SDL_image.metadata.description';
  IMG_PROP_METADATA_COPYRIGHT_STRING = 'SDL_image.metadata.copyright';
  IMG_PROP_METADATA_TITLE_STRING = 'SDL_image.metadata.title';
  IMG_PROP_METADATA_AUTHOR_STRING = 'SDL_image.metadata.author';
  IMG_PROP_METADATA_CREATION_TIME_STRING = 'SDL_image.metadata.creation_time';
  IMG_PROP_METADATA_FRAME_COUNT_NUMBER = 'SDL_image.metadata.frame_count';
  IMG_PROP_METADATA_LOOP_COUNT_NUMBER = 'SDL_image.metadata.loop_count';

function IMG_GetAnimationDecoderFrame(decoder: PIMG_AnimationDecoder; frame: PPSDL_Surface; duration: PUint64): Tbool; cdecl; external libSDL3_image;
function IMG_GetAnimationDecoderStatus(decoder: PIMG_AnimationDecoder): TIMG_AnimationDecoderStatus; cdecl; external libSDL3_image;
function IMG_ResetAnimationDecoder(decoder: PIMG_AnimationDecoder): Tbool; cdecl; external libSDL3_image;
function IMG_CloseAnimationDecoder(decoder: PIMG_AnimationDecoder): Tbool; cdecl; external libSDL3_image;

implementation

function SDL_IMAGE_VERSION: longint;
begin
  SDL_IMAGE_VERSION := SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_MICRO_VERSION);
end;

function SDL_IMAGE_VERSION_ATLEAST(X, Y, Z: longint): boolean;
begin
  Result :=
    (SDL_IMAGE_MAJOR_VERSION >= X) and
    ((SDL_IMAGE_MAJOR_VERSION > X) or (SDL_IMAGE_MINOR_VERSION >= Y)) and
    ((SDL_IMAGE_MAJOR_VERSION > X) or (SDL_IMAGE_MINOR_VERSION > Y) or (SDL_IMAGE_MICRO_VERSION >= Z));
end;


end.
