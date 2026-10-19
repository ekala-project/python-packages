{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "pyclip";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spyoungtech";
    repo = "pyclip";
    tag = "v${version}";
    hash = "sha256-0nOkNgT8XCwtXI9JZntkhoMspKQU602rTKBFajVKBoM=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace docs/README.md README.md
  '';

  # available in the build environment.
  meta = {
    description = "Cross-platform clipboard utilities supporting both binary and text data";
    mainProgram = "pyclip";
    homepage = "https://github.com/spyoungtech/pyclip";
    license = lib.licenses.asl20;
  };
}
