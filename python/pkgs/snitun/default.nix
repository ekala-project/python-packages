{
  lib,
  aiohttp,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "snitun";
  version = "0.45.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "NabuCasa";
    repo = "snitun";
    tag = version;
    hash = "sha256-luXv5J0PUvW+AGTecwkEq+qkG1N5Ja5NbBKJ3M6HC0I=";
  };

  patches = [
    # https://github.com/NabuCasa/snitun/pull/459
    ./fix-python-3.14-compatibility.diff
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.0.0"' 'version = "${version}"'
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
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
