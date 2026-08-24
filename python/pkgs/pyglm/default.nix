{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage rec {
  pname = "pyglm";
  version = "2.8.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Zuzu-Typ";
    repo = "PyGLM";
    tag = version;
    hash = "sha256-7IN/kqFCwAMeVUrBB/CfCm9bSt1dHMbbLtqVInRFCk0=";
    fetchSubmodules = true;
  };

  build-system = [ setuptools ];

  # Having the source root in `sys.path` causes import issues
  meta = {
    homepage = "https://github.com/Zuzu-Typ/PyGLM";
    description = "OpenGL Mathematics (GLM) library for Python written in C++";
    license = lib.licenses.zlib;
    maintainers = [ ];
  };
}
