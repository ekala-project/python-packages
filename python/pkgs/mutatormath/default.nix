{
  buildPythonPackage,
  fetchPypi,
  defcon,
  fontmath,
  setuptools,
  unicodedata2,
}:

buildPythonPackage (finalAttrs: {
  pname = "mutatormath";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "MutatorMath";
    inherit (finalAttrs) version;
    sha256 = "0r1qq45np49x14zz1zwkaayqrn7m8dn2jlipjldg2ihnmpzw29w1";
    extension = "zip";
  };

  build-system = [ setuptools ];

  dependencies = [
    fontmath
    unicodedata2
    defcon
  ];

})
