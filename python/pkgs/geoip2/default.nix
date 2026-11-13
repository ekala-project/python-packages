{
  lib,
  fetchPypi,
  buildPythonPackage,
  uv-build,
  aiohttp,
  maxminddb,
  requests,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "geoip2";
  version = "5.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Zt9lPhbFNfm7RePHzpkvvgCJEdnHw0lUBXTqL+iTHbU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml --replace-fail "uv_build>=0.11.26,<0.12.0" "uv_build"
  '';

  build-system = [
    uv-build
  ];

  dependencies = [
    aiohttp
    maxminddb
    requests
    urllib3
  ];

  pythonImportsCheck = [ "geoip2" ];

  meta = {
    description = "GeoIP2 webservice client and database reader";
    homepage = "https://github.com/maxmind/GeoIP2-python";
    license = lib.licenses.asl20;
  };
})
