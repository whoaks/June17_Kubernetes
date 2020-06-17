provider "kubernetes" {
  config_context_cluster = "minikube"
}

resource "kubernetes_pod" "pod1" {
  metadata {
    name = "akspod"
  }
  
  spec {
    container {
      image = "vimal13/apache-webserver-php"
      name = "mycon"
      }
   }
}