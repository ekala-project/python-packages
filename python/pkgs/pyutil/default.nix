{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,
  setuptools,
  simplejson,
  versioneer,
}:

buildPythonPackage rec {
  pname = "pyutil";
  version = "3.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8RHsCEieQ3/uHPkNai+sUBR2hDJAVrYy5DMlp6YRw6c=";
  };

  prePatch = lib.optionalString isPyPy ''
    grep -rl 'utf-8-with-signature-unix' ./ | xargs sed -i -e "s|utf-8-with-signature-unix|utf-8|g"
  '';

  nativeBuildInputs = [
    setuptools
    versioneer
  ];

  optional-dependencies = {
    jsonutil = [ simplejson ];
    # Module not available
    # randcookie = [
    #   zbase32
    # ];
  };

  pythonImportsCheck = [ "pyutil" ];

  meta = {
    description = "Collection of mature utilities for Python programmers";
    homepage = "https://github.com/tpltnt/pyutil";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}
