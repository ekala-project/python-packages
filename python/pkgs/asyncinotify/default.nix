{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "asyncinotify";
  version = "4.4.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "absperf";
    repo = "asyncinotify";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NncqHS6JK9OYv/155PXYi0Sg4oX7p0WAGZ9wnvoYlgE=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "asyncinotify" ];

  meta = {
    description = "Module for inotify";
    homepage = "https://github.com/absperf/asyncinotify";
    license = lib.licenses.mpl20;
  };
})
