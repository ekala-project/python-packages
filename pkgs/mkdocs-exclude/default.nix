{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  mkdocs,
  setuptools,
}:

buildPythonPackage {
  pname = "mkdocs-exclude";
  version = "1.0.2";
  pyproject = true;

  # Repository has only 3 commits and no tags. Each of these commits has
  # version of 1.0.0, 1.0.1 and 1.0.2 in setup.py, though.
  src = fetchFromGitHub {
    owner = "apenwarr";
    repo = "mkdocs-exclude";
    rev = "fdd67d2685ff706de126e99daeaaaf3f6f7cf3ae";
    hash = "sha256-zeW+GMRE8xZoO3/2pd8YmUG1SP2Fi6UFR7gT19OhEN4=";
  };

  build-system = [ setuptools ];

  dependencies = [ mkdocs ];

  # mkdocs is not available at build time for the runtime deps check
  dontCheckRuntimeDeps = true;

  meta = {
    description = "Mkdocs plugin to exclude files from input using globs or regexes";
    homepage = "https://github.com/apenwarr/mkdocs-exclude";
    license = lib.licenses.asl20;
  };
}
