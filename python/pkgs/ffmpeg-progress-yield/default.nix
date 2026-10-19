{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uv-build,
  tqdm,
  ffmpeg,
  versionCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ffmpeg-progress-yield";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slhck";
    repo = "ffmpeg-progress-yield";
    tag = "v${finalAttrs.version}";
    hash = "sha256-OEE23gzPYcjKjrar+aV2zZuZyhrvqkYPhnWC3GzefUI=";
  };

  build-system = [ uv-build ];

  dependencies = [
    tqdm
  ];

  pythonImportsCheck = [ "ffmpeg_progress_yield" ];

  nativeInstallCheckInputs = [ versionCheckHook ];

  meta = {
    description = "Run an ffmpeg command with progress";
    mainProgram = "ffmpeg-progress-yield";
    homepage = "https://github.com/slhck/ffmpeg-progress-yield";
    license = lib.licenses.mit;
  };
})
