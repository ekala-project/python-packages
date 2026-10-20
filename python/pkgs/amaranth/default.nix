{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  jschon,
  pyvcd,
  jinja2,
  git,
}:

buildPythonPackage (finalAttrs: {
  pname = "amaranth";
  version = "0.5.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amaranth-lang";
    repo = "amaranth";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FwRraLPTzRKpdmzHpoAI0V/qTigT89VP+B3ue++t+Vg=";
  };

  pythonRelaxDeps = [ "pyvcd" ];

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
    mainProgram = "amaranth-rpc";
  };
})
