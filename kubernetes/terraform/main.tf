resource "kubernetes_deployment" "blueappdeployment" {
  metadata {
    name = "blue-app"
    labels = {
      app = "blue-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "blue-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "blue-app"
        }
      }

      spec {
        container {
          image = "luliveira/blueapp"
          name  = "blue-app"
        }

        affinity {
          pod_anti_affinity {
            preferred_during_scheduling_ignored_during_execution {
              pod_affinity_term {
                topology_key = "kubernetes.io/hostname"
                label_selector {
                  match_expressions {
                    key      = "app"
                    operator = "In"
                    values   = ["blue-app"]
                  }
                }
              }
              weight = 1
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "blueappservice" {
  metadata {
    name = "blue-app"
  }
  spec {
    selector = {
      app = kubernetes_deployment.blueappdeployment.metadata.0.labels.app
    }
    port {
      port        = 8080
      target_port = 8080
    }
  }
}

resource "kubernetes_ingress_v1" "ingresssubdominio" {
  metadata {
    name = "ingress-subdominio"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" : "/"
      "nginx.ingress.kubernetes.io/affinity" : "cookie"
      "nginx.ingress.kubernetes.io/session-cookie-name" : "JSESSIONID"
      "nginx.ingress.kubernetes.io/session-cookie-expires" : "172800"
      "nginx.ingress.kubernetes.io/session-cookie-max-age" : "172800"
      "nginx.ingress.kubernetes.io/affinity-mode" : "persistent"
    }
  }

  spec {
    ingress_class_name = "nginx"

    default_backend {
      service {
        name = "nginx"
        port {
          number = 80
        }
      }
    }

    rule {
      http {
        path {
          path = "/blue"
          backend {
            service {
              name = "blue-app"
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}

