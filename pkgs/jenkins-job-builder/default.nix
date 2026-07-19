{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pbr,
  python-jenkins,
  pyyaml,
  six,
  stevedore,
  fasteners,
  jinja2,
}:

buildPythonPackage (finalAttrs: {
  pname = "jenkins-job-builder";
  version = "6.4.4";
  pyproject = true;

  src = fetchPypi {
    pname = "jenkins_job_builder";
    inherit (finalAttrs) version;
    hash = "sha256-7PpCDpe3KLRpt+R/Nu+qxdDxLKWVqTiCPK3j+nNaum8=";
  };

  postPatch = ''
    export HOME=$(mktemp -d)
  '';

  build-system = [ setuptools ];

  dependencies = [
    pbr
    python-jenkins
    pyyaml
    six
    stevedore
    fasteners
    jinja2
  ];

  pythonImportsCheck = [ "jenkins_jobs" ];

  meta = {
    description = "Jenkins Job Builder is a system for configuring Jenkins jobs using simple YAML files stored in Git";
    mainProgram = "jenkins-jobs";
    homepage = "https://jenkins-job-builder.readthedocs.io/en/latest/";
    license = lib.licenses.asl20;
  };
})
