# Install Prometheus and Grafana on the Kubernetes cluster:

- Deploy the Prometheus StatefulSet:

```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/bundle.yaml
```

- Deploy the Grafana Deployment:

```bash
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/contrib/kube-prometheus/manifests/grafana/grafana-deployment.yaml
```

1. Configure Prometheus and Grafana for monitoring the Kubernetes cluster:

- Configure Prometheus to scrape the Kubernetes API server for metrics:

```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-k8s
  namespace: monitoring
data:
  prometheus.yml: |-
    # my global config
    global:
      scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
      evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
      # scrape_timeout is set to the global default (10s).

    # Alertmanager configuration
    alerting:
      alertmanagers:
      - static_configs:
        - targets:
          # - alertmanager:9093

    # Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
    rule_files:
      # - "first_rules.yml"
      # - "second_rules.yml"

    # A scrape configuration containing exactly one endpoint to scrape:
    # Here it's Prometheus itself.
    scrape_configs:
      # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
      - job_name: 'prometheus'

        # metrics_path defaults to '/metrics'
        # scheme defaults to 'http'.

        static_configs:
        - targets: ['localhost:9090']

      - job_name: 'kubernetes-apiservers'

        kubernetes_sd_configs:
        - role: endpoints

        relabel_configs:
        - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: default;kubernetes;https

        # Default to scraping over https
        scheme: https

        tls_config:
          ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
        bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
```

- Configure Grafana to access the Prometheus API:

```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-datasources
  namespace: monitoring
data:
  datasources.yaml: |-
    apiVersion: 1
    datasources:
    - name: Prometheus
      type: prometheus
      access: proxy
      url: http://prometheus-k8s.monitoring.svc.cluster.local:9090
      isDefault: true
```

2. Access the Grafana dashboard to view the monitoring data:

The Grafana dashboard can be accessed with the following command:

```bash
kubectl port-forward -n monitoring service/grafana 3000:3000
```

Once the port-forwarding is established, you can access the Grafana dashboard by navigating to http://localhost:3000 in your browser.