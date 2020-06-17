provider "kubernetes" {
config_context_cluster = "minikube"
}

resource "kubernetes_replication_controller" "myrc" {
metadata {
name = "rc1"
}

spec {
replicas = 3
selector = {
env = "the_wall"
dc = "north"
app = "server"
}
template {
metadata {
labels = {
env = "the_wall"
dc = "north"
app = "server"
}
annotations = {
"key1" = "value1"
}
}

spec {
container {
image = "vimal13/apache-webserver-php"
name = "con1"
}
}
}
}
}