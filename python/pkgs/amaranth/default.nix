{ lib
, buildPythonPackage
, fetchFromGitHub
, pdm-backend
, jschon
, pyvcd
, jinja2
, git
,
}:

buildPythonPackage rec {
  pname = "amaranth";
  version = "0.5.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amaranth-lang";
    repo = "amaranth";
    tag = "v${version}";
    hash = "sha256-FwRraLPTzRKpdmzHpoAI0V/qTigT89VP+B3ue++t+Vg=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "pdm-backend~=2.3.0" "pdm-backend>=2.3.0"
  '';

  nativeBuildInputs = [ git ];

  build-system = [ pdm-backend ];

  dependencies = [
    jschon
    jinja2
    pyvcd
  ];

  pythonImportsCheck = [ "amaranth" ];

  meta = {
    description = "Modern hardware definition language and toolchain based on Python";
    homepage = "https://amaranth-lang.org/docs/amaranth";
    license = lib.licenses.bsd2;
    maintainers = [ ];
    mainProgram = "amaranth-rpc";
  };
}
