{
  lib,
  aiohttp,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "snitun";
  version = "0.47.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "NabuCasa";
    repo = "snitun";
    tag = finalAttrs.version;
    hash = "sha256-l7iXTXY6Dq1LV4ju6/WlipTSeybne33tiFYiwgy+DuM=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${finalAttrs.version}"'
  '';

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    cryptography
  ];

  pythonImportsCheck = [ "snitun" ];

  meta = {
    description = "SNI proxy with TCP multiplexer";
    homepage = "https://github.com/nabucasa/snitun";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
})
