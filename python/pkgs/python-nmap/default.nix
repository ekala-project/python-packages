{
  lib,
  buildPythonPackage,
  fetchPypi,
  nmap,
}:

buildPythonPackage rec {
  pname = "python-nmap";
  version = "0.7.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-91r2uR3Y47DDH4adsyFj9iraaGlF5bfCX4S8D3+tO2Q=";
  };

  propagatedBuildInputs = [ nmap ];

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace "universal=3" "universal=1"
  '';

  pythonImportsCheck = [ "nmap" ];

  meta = {
    description = "Python library which helps in using nmap";
    homepage = "https://xael.org/pages/python-nmap-en.html";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
  };
}
