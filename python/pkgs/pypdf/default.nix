{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # optionals
  cryptography,
  fonttools,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "pypdf";
  version = "7.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "py-pdf";
    repo = "pypdf";
    tag = finalAttrs.version;
    fetchSubmodules = true;
    hash = "sha256-US6xKukjLUN1Z5BwF8ZewN3USC/L6MJ6jrira70VwGI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "--disable-socket" ""
  '';

  build-system = [ flit-core ];

  optional-dependencies = rec {
    full = crypto ++ fonts ++ image;
    crypto = [ cryptography ];
    fonts = [ fonttools ];
    image = [ pillow ];
  };

  pythonImportsCheck = [ "pypdf" ];

  meta = {
    description = "Pure-python PDF library capable of splitting, merging, cropping, and transforming the pages of PDF files";
    homepage = "https://github.com/py-pdf/pypdf";
    license = lib.licenses.bsd3;
  };
})
