

// Step 1: Abstract Listener - RidePreferencesListener
abstract class RidePreferencesListener {
  // Method to handle when a preference is selected
  void onPreferenceSelected(RidePreference selectedPreference);
}

class RidePreference {
  final String preferenceName;

  RidePreference(this.preferenceName);
}


class RidePreferencesService{
  List<RidePreferencesListener> _listeners = []  ;

  void addListener(RidePreferencesListener listener){
     _listeners.add(listener) ;
}

void notifyListener(RidePreference selectedPreference ){
    for(var listener in _listeners){
      listener.onPreferenceSelected(selectedPreference);
    }
}
}

class ConsoleLogger implements RidePreferencesListener{
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("This is ConsoleLogger : ${selectedPreference.preferenceName}");
  }



}

void main(){
  RidePreferencesService service = RidePreferencesService() ;

  ConsoleLogger console = ConsoleLogger() ;

  service.addListener(console) ;

  print("This is ")  ;
  service.notifyListener(RidePreference("Hello")) ;
   ;
}

