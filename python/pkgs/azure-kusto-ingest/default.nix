{
  lib,
  aiohttp,
  azure-kusto-data,
  azure-storage-blob,
  azure-storage-queue,
  buildPythonPackage,
  fetchFromGitHub,
  pandas,
  pytest-asyncio,
  pytest-xdist,
  responses,
  uv-build,
  tenacity,
}:

buildPythonPackage rec {
  pname = "azure-kusto-ingest";
  version = "6.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "azure-kusto-python";
    tag = "v${version}";
    hash = "sha256-iggsVxLmDbP6+oSPaIiujPLsZAWwm5VLZSl+HYm0DIQ=";
  };

  sourceRoot = "${src.name}/${pname}";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.8.9,<0.9.0" uv-build
  '';

  build-system = [ uv-build ];

  dependencies = [
    azure-kusto-data
    azure-storage-blob
    azure-storage-queue
    tenacity
  ];

  pythonRelaxDeps = [
    "azure-storage-blob"
    "azure-storage-queue"
  ];

  optional-dependencies = {
    pandas = [ pandas ];
  };
  meta = {
    description = "Module for Kusto Ingest";
    homepage = "https://github.com/Azure/azure-kusto-python/tree/master/azure-kusto-ingest";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
