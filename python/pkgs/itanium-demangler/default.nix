{
  lib,
  buildPythonPackage,
  fetchurl,
  setuptools,
}:

buildPythonPackage rec {
  pname = "itanium_demangler";
  version = "1.1";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/78/0d/fba3dcefcfcbc9da4e97e55427a5a739e920430ac53d770d98b7a5203500/itanium_demangler-1.1-py3-none-any.whl";
    hash = "sha256-W8K6TS8uPjuKogHkOEQz/Qmlf1EqdxfKOEn5PuNPgYk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "itanium_demangler" ];

  meta = {
    description = "Python parser for the Itanium C++ ABI symbol mangling language";
    homepage = "https://github.com/whitequark/python-itanium_demangler";
    license = lib.licenses.bsd0;
  };
}
