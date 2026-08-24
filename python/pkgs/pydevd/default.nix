{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  cython
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydevd";
  version = "3.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fabioz";
    repo = "PyDev.Debugger";
    tag = "pydev_debugger_${lib.replaceStrings [ "." ] [ "_" ] finalAttrs.version}";
    hash = "sha256-srcYeN4IsnX/B0AWLynr62UC5o+DcjnUrGjcTpvHTCM=";
  };

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "pydevd" ];

  meta = {
    description = "PyDev.Debugger (used in PyDev, PyCharm and VSCode Python)";
    homepage = "https://github.com/fabioz/PyDev.Debugger";
    license = lib.licenses.epl10;
    maintainers = [ ];
    mainProgram = "pydevd";
  };
})
