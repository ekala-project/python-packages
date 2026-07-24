{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aiohttp-retry";
  version = "2.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "inyutin";
    repo = "aiohttp_retry";
    tag = "v${version}";
    hash = "sha256-8S4gjeN8ktdDNd8GUsejaZdCaG/VXYPo0RJpwrrttGQ=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail 'version="2.9.0"' 'version="${version}"'
  '';

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];
  pythonImportsCheck = [ "aiohttp_retry" ];
  meta = {
    description = "Retry client for aiohttp";
    homepage = "https://github.com/inyutin/aiohttp_retry";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
