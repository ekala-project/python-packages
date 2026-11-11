{
  lib,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  h2,
  httpcore,
  httpx,
  idna,
  uv-build,
  trio,
}:

buildPythonPackage (finalAttrs: {
  pname = "dnspython";
  version = "2.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-jU05pRPmSdY0AEzk05reI1LvzqRyoCR1NaXC0Yqde6k=";
  };

  build-system = [ uv-build ];

  optional-dependencies = {
    doh = [
      httpx
      h2
      httpcore
    ];
    idna = [ idna ];
    dnssec = [ cryptography ];
    trio = [ trio ];
  };

  pythonImportsCheck = [ "dns" ];

  meta = {
    description = "DNS toolkit for Python";
    homepage = "https://www.dnspython.org";
    license = lib.licenses.isc;
  };
})
