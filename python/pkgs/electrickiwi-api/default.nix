{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "electrickiwi-api";
  version = "0.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mikey0000";
    repo = "EK-API";
    tag = "v${version}";
    hash = "sha256-3wT33oEbvfEdsNXqzFLPsn+ZfA/Qr3EwgZPfuZfm7XY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.0,<0.9.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "electrickiwi_api" ];

  # Tests require authentication credentials
  doCheck = false;

  meta = {
    description = "Python library for interfacing with the Electric Kiwi power company API";
    homepage = "https://github.com/mikey0000/EK-API";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
