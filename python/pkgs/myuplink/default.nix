{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "myuplink";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pajzo";
    repo = "myuplink";
    tag = version;
    hash = "sha256-r06aap8FiRslRRgKKSH7vNzpoVn6rX8ZR0oQ0D68xDo=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace-fail "%%VERSION_NO%%" "${version}"
  '';

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "myuplink" ];

  meta = {
    description = "Module to interact with the myUplink API";
    homepage = "https://github.com/pajzo/myuplink";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
