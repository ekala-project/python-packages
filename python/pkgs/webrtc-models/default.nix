{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mashumaro,
  orjson,
  pythonOlder,
}:

buildPythonPackage (finalAttrs: {
  pname = "webrtc-models";
  version = "0.3.0";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "python-webrtc-models";
    tag = finalAttrs.version;
    hash = "sha256-WZPI7vYlfsihskRtrh4XJGx0JSDwn7JIJ8CL3jlryrA=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${finalAttrs.version}"'
  '';

  pythonRelaxDeps = [ "orjson" ];

  build-system = [ hatchling ];

  dependencies = [
    mashumaro
    orjson
  ];

  pythonImportsCheck = [ "webrtc_models" ];

  meta = {
    description = "WebRTC models as Python dataclasses with mashumaro";
    homepage = "https://github.com/home-assistant-libs/python-webrtc-models";
    license = lib.licenses.asl20;
  };
})
