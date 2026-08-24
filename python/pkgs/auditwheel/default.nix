{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  pyelftools,
  packaging,
}:

buildPythonPackage rec {
  pname = "auditwheel";
  version = "6.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cKpP6OJNRH6ftHCC8KoN4ta96Kqpu/5RcCAyjOqA4PE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    packaging
    pyelftools
  ];

  # Ensure that there are no undeclared deps
  meta = {
    description = "Auditing and relabeling cross-distribution Linux wheels";
    homepage = "https://github.com/pypa/auditwheel";
    license = with lib.licenses; [
      mit # auditwheel and nibabel
      bsd2 # from https://github.com/matthew-brett/delocate
      bsd3 # from https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-projects/pax-utils/lddtree.py
    ];
    mainProgram = "auditwheel";
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
