{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,
  hatchling,

  # dependencies
  requests,
  securesystemslib,

  # tests
  ed25519,
  freezegun,
}:

buildPythonPackage (finalAttrs: {
  pname = "tuf";
  version = "7.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "theupdateframework";
    repo = "python-tuf";
    tag = "v${finalAttrs.version}";
    hash = "sha256-/Dg/n00p6udprGbW4el1285dYsr0tEz+KC3RXc28xv0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "hatchling==1.32.0" "hatchling"
  '';

  build-system = [
    flit-core
    hatchling
  ];

  dependencies = [
    requests
    securesystemslib
  ]
  ++ securesystemslib.optional-dependencies.pynacl
  ++ securesystemslib.optional-dependencies.crypto;
  pythonImportsCheck = [ "tuf" ];
  meta = {
    description = "Python reference implementation of The Update Framework (TUF)";
    homepage = "https://github.com/theupdateframework/python-tuf";
    license = with lib.licenses; [
      asl20
      mit
    ];
    maintainers = [ ];
  };
})
