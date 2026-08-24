{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rpm,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "specfile";
  version = "0.39.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "packit";
    repo = "specfile";
    tag = finalAttrs.version;
    postFetch = ''
      # export-subst prevents reproducibility
      rm "$out/.git_archival.txt"
    '';
    hash = "sha256-z9HGnBLdtJ4uzm1DJFD0QN/DZNTdBbZcPx/kefCYnkc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ rpm ];

  pythonImportsCheck = [ "specfile" ];

  meta = {
    description = "Library for parsing and manipulating RPM spec files";
    homepage = "https://github.com/packit/specfile";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
