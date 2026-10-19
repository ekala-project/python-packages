{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiowebostv";
  version = "0.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "aiowebostv";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LtQkuAoqC6ELlcz56m0J+v8IuGGJn9SAoQsUNoL76m0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${finalAttrs.version}"'
  '';

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # Module doesn't have tests

  pythonImportsCheck = [ "aiowebostv" ];

  meta = {
    description = "Module to interact with LG webOS based TV devices";
    homepage = "https://github.com/home-assistant-libs/aiowebostv";
    license = lib.licenses.asl20;
  };
})
