{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygtail";
  version = "0.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bgreenlee";
    repo = "pygtail";
    tag = finalAttrs.version;
    hash = "sha256-TlXTlxeGDd+elGpMjxcJCmRuJmp5k9xj6MrViRzcST4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pygtail" ];

  meta = {
    description = "Library for reading log file lines that have not been read";
    mainProgram = "pygtail";
    license = lib.licenses.gpl2Plus;
    homepage = "https://github.com/bgreenlee/pygtail";
  };
})
