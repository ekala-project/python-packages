{
  lib,
  buildPythonPackage,
  distro,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "ruyaml";
  version = "0.91.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycontribs";
    repo = "ruyaml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-A37L/voBrn2aZ7xT8+bWdZJxbWRjnxbstQtSyUeN1sA=";
  };

  postPatch = ''
    # https://github.com/pycontribs/ruyaml/pull/107
    substituteInPlace pyproject.toml \
      --replace '"pip >= 19.3.1",' "" \
      --replace '"setuptools_scm_git_archive >= 1.1",' ""
  '';

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [ distro ];
  pythonImportsCheck = [ "ruyaml" ];
  meta = {
    description = "YAML 1.2 loader/dumper package for Python";
    homepage = "https://ruyaml.readthedocs.io/";
    license = lib.licenses.mit;
  };
})
