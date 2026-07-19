{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  file,
}:

buildPythonPackage rec {
  pname = "python-magic";
  version = "0.4.27";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wboUsI5KX1wxowK3chI5aVsvDwWNElvVzh7ja52dPDs=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace magic/loader.py \
      --replace-fail "yield find_library('magic')" "yield '${file}/lib/libmagic.so'"
  '';

  pythonImportsCheck = [ "magic" ];

  meta = {
    homepage = "https://github.com/ahupp/python-magic";
    description = "Python interface to the libmagic file type identification library";
    license = lib.licenses.mit;
  };
}
