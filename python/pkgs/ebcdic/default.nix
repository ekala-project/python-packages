{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "ebcdic";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "roskakori";
    repo = "CodecMapper";
    tag = "v${finalAttrs.version}";
    hash = "sha256-71EMWUGoJrsc3EOVHeV4xqSJRKoA7Sz2dvmZJ1sjQCg=";
  };

  sourceRoot = "${finalAttrs.src.name}/${finalAttrs.pname}";

  build-system = [ flit-core ];
  pythonImportsCheck = [ "ebcdic" ];

  meta = {
    description = "Additional EBCDIC codecs";
    homepage = "https://github.com/roskakori/CodecMapper/tree/master/ebcdic";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
