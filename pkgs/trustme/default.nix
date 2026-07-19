{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  cryptography,
  idna,
}:

buildPythonPackage rec {
  pname = "trustme";
  version = "1.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZSi6K7x/LbQfM4JcjdE+Pj650zS6D5CXE8jDE59K5H8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    cryptography
    idna
  ];

  doCheck = false;

  pythonImportsCheck = [ "trustme" ];

  meta = {
    description = "High quality TLS certs while you wait, for the discerning tester";
    homepage = "https://github.com/python-trio/trustme";
    license = with lib.licenses; [
      mit
      asl20
    ];
  };
}
