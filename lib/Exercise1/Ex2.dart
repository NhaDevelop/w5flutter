// // Observer: This is the class that will listen to updates.
// abstract class NewsSubscriber {
//   void update(String news);
// }
//
// // Subject: This is the publisher that notifies all subscribers.
// class NewsPublisher {
//   List<NewsSubscriber> _subscribers = [];
//
//   // Add a subscriber to the list.
//   void addSubscriber(NewsSubscriber subscriber) {
//     _subscribers.add(subscriber);
//   }
//
//   // Notify all subscribers about a news update.
//   void notifySubscribers(String news) {
//     for (var subscriber in _subscribers) {
//       subscriber.update(news);
//     }
//   }
// }
//
// // Concrete Observers: These are the subscribers (they react to updates).
// class PhoneDisplay implements NewsSubscriber {
//   @override
//   void update(String news) {
//     print("📱 Phone Display: $news");
//   }
// }
//
// class TVDisplay implements NewsSubscriber {
//   @override
//   void update(String news) {
//     print("📺 TV Display: $news");
//   }
// }
//
// void main() {
//   // Create the subject (NewsPublisher)
//   NewsPublisher publisher = NewsPublisher();
//
//   // Create the observers (subscribers)
//   PhoneDisplay phone = PhoneDisplay();
//   TVDisplay tv = TVDisplay();
//
//
//   // Register the observers (subscribers) to the publisher (subject)
//
//   publisher.addSubscriber(phone);
//   publisher.addSubscriber(tv);
//
//
//   // Publisher sends a news update
//   print("📰 Publishing news update...");
//   publisher.notifySubscribers("Breaking news: New Observer Pattern Example!");
//   publisher.notifySubscribers("Hello");
//   publisher.notifySubscribers("Mean herng ey men");
//
// }

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

