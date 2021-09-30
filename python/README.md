# The python libvirtd monitoring

The aim is to wait for poweroff, and based on state machine decide whether new start or other action is needed.

Here is a collection from real-world, when `virsh start wimtest` followed by `virsh destroy wimtest` was called:


```
python python/libvirt-listen-events.py
Connecting to qemu:///system
Connected

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
wimtest: event: VIR_DOMAIN_EVENT_RESUMED (4)
wimtest: state: VIR_DOMAIN_RUNNING (1)
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
wimtest: event: VIR_DOMAIN_EVENT_STARTED (2)
wimtest: state: VIR_DOMAIN_RUNNING (1)
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
wimtest: event: VIR_DOMAIN_EVENT_SHUTDOWN (6)
wimtest: state: VIR_DOMAIN_SHUTOFF (5)
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
wimtest: event: VIR_DOMAIN_EVENT_STOPPED (5)
wimtest: state: VIR_DOMAIN_SHUTOFF (5)
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
```