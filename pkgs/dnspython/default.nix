{
  lib,
  aioquic,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  h2,
  httpcore,
  httpx,
  idna,
  hatchling,
  trio,
}:

buildPythonPackage rec {
  pname = "dnspython";
  version = "2.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GB08aZZFLLEYnEBGxhWZuEpahuCZVi/9530mmE/ybQ8=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    doh = [
      httpx
      h2
      httpcore
    ];
    idna = [ idna ];
    dnssec = [ cryptography ];
    trio = [ trio ];
    doq = [ aioquic ];
  };

  pythonImportsCheck = [ "dns" ];

  meta = {
    description = "DNS toolkit for Python";
    homepage = "https://www.dnspython.org";
    license = lib.licenses.isc;
  };
}
