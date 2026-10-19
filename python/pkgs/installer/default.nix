{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "installer";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "installer";
    tag = version;
    hash = "sha256-GkHLZfzHfTcBL8wQmIGlNkVodEw9Pih4i1SS36mSfBo=";
  };

  patches = [
    ./cross.patch
  ];

  nativeBuildInputs = [ flit-core ];

  meta = {
    description = "Low-level library for installing a Python package from a wheel distribution";
    homepage = "https://github.com/pypa/installer";
    license = lib.licenses.mit;
  };
}
