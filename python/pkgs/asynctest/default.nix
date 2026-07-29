{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonAtLeast,
}:

buildPythonPackage rec {
  pname = "asynctest";
  version = "0.13.0";
  format = "setuptools";

  # Unmaintained and incompatible python 3.11
  disabled = pythonAtLeast "3.11";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1b3zsy7p84gag6q8ai2ylyrhx213qdk2h2zb6im3xn0m5n264y62";
  };

  pythonImportsCheck = [ "asynctest" ];

  meta = {
    description = "Enhance the standard unittest package with features for testing asyncio libraries";
    homepage = "https://github.com/Martiusweb/asynctest";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
