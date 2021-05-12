import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontix/models/models.dart';
import 'package:ontix/services/services.dart';

part 'ticket_state.dart';
part 'ticket_event.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc(TicketState initialState) : super(initialState);

  TicketState get initialState => TicketState([]);

  @override
  Stream<TicketState> mapEventToState(TicketEvent event) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userID, event.ticket);

      //ticket yang skrg ditambah ticket event(update)
      List<Ticket> tickets = state.tickets + [event.ticket];

      yield TicketState(tickets);
    } else if (event is GetTicket) {
      List<Ticket> tickets = await TicketServices.getTicket(event.userID);
      yield TicketState(tickets);
    }
  }
}
