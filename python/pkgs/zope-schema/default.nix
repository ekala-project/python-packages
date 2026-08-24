{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, zope-event
, zope-interface
,
}:

buildPythonPackage rec {
  pname = "zope-schema";
  version = "8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.schema";
    tag = version;
    hash = "sha256-pO3yL0gej2PGD01ySiPJPU66P/9hW73T2n/ZnUPa3C0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [
    zope-event
    zope-interface
  ];

  pythonImportsCheck = [ "zope.schema" ];

  unittestFlagsArray = [ "src/zope/schema/tests" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    homepage = "https://github.com/zopefoundation/zope.schema";
    description = "zope.interface extension for defining data schemas";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}
