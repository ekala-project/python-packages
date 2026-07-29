{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyparsing,
  typing-extensions,
  setuptools,
  cython,
  numpy,
  fonttools,
}:

buildPythonPackage rec {
  version = "1.4.3";
  pname = "ezdxf";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "mozman";
    repo = "ezdxf";
    tag = "v${version}";
    hash = "sha256-v/xW/Tg3OgzwvSNy3cfkxzf6R33ZvW4VE8k7MB+rM+w=";
  };

  dependencies = [
    pyparsing
    typing-extensions
    numpy
    fonttools
  ];

  build-system = [
    setuptools
    cython
  ];

  pythonImportsCheck = [
    "ezdxf"
    "ezdxf.addons"
  ];

  meta = {
    description = "Python package to read and write DXF drawings (interface to the DXF file format)";
    mainProgram = "ezdxf";
    homepage = "https://ezdxf.mozman.at/";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}
