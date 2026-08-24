{ lib
, buildPythonPackage
, fetchFromGitLab
,
}:

buildPythonPackage rec {
  pname = "plum-py";
  version = "0.8.7";
  format = "setuptools";

  src = fetchFromGitLab {
    owner = "dangass";
    repo = "plum";
    tag = version;
    hash = "sha256-q9UNRZYBLBm0mf/r3cktGnGG9LzmTDrSVgXDgGDBMok=";
  };

  postPatch = ''
    # Drop broken version specifier
    sed -i "/python_requires =/d" setup.cfg
  '';

  pythonImportsCheck = [ "plum" ];

  meta = {
    description = "Classes and utilities for packing/unpacking bytes";
    homepage = "https://plum-py.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
