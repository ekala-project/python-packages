{ lib
, buildPythonPackage
, fetchFromGitHub
,
}:

buildPythonPackage rec {
  pname = "sarge";
  version = "0.1.7.post1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "vsajip";
    repo = "sarge";
    rev = version;
    hash = "sha256-bT1DbcQi+SbeRBsL7ILuQbSnAj3BBB4+FNl+Zek5xU4=";
  };

  pythonImportsCheck = [ "sarge" ];

  meta = {
    description = "Python wrapper for subprocess which provides command pipeline functionality";
    homepage = "https://sarge.readthedocs.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
