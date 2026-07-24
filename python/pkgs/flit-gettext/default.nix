{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,

  # build-system
  flit-scm,
  wheel,

  # dependencies
  flit-core,
  gettext,

  # tests
  build,
  pytest-cov-stub,
}:

buildPythonPackage rec {
  pname = "flit-gettext";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "codingjoe";
    repo = "flit-gettext";
    rev = version;
    hash = "sha256-rCIMwAiXXCJ+PH26/hoPWsuKd68crWStBErAOh9wzUg=";
  };

  patches = [
    (replaceVars ./msgfmt-path.patch {
      msgfmt = lib.getExe' gettext "msgfmt";
    })
  ];

  nativeBuildInputs = [
    flit-scm
    wheel
  ];

  propagatedBuildInputs = [ flit-core ];

  optional-dependencies = {
    scm = [ flit-scm ];
  };
  pythonImportsCheck = [ "flit_gettext" ];

  meta = {
    description = "Compiling gettext i18n messages during project bundling";
    homepage = "https://github.com/codingjoe/flit-gettext";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
