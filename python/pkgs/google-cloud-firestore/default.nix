{
  lib,
  aiounittest,
  buildPythonPackage,
  fetchFromGitHub,
  freezegun,
  google-api-core,
  google-cloud-core,
  google-cloud-testutils,
  mock,
  proto-plus,
  protobuf,
  pytest-asyncio,
  pythonAtLeast,
  pythonOlder,
  pyyaml,
  setuptools,
  nix-update-script,
}:

buildPythonPackage (finalAttrs: {
  pname = "google-cloud-firestore";
  version = "2.28.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-cloud-python";
    tag = "google-cloud-firestore-v${finalAttrs.version}";
    hash = "sha256-dct5yBerIMNQgVIvOWdO9yTxSrH1JDUen6I7CYHftC0=";
  };

  sourceRoot = "${finalAttrs.src.name}/packages/google-cloud-firestore";

  build-system = [ setuptools ];

  dependencies = [
    google-api-core
    google-cloud-core
    proto-plus
    protobuf
  ]
  ++ google-api-core.optional-dependencies.grpc;

  pythonRelaxDeps = [ "protobuf" ];
  pythonImportsCheck = [
    "google.cloud.firestore_v1"
    "google.cloud.firestore_admin_v1"
  ];

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--version-regex"
      "google-cloud-firestore-v(.*)"
    ];
  };

  meta = {
    description = "Google Cloud Firestore API client library";
    homepage = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-firestore";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
